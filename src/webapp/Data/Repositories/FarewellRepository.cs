namespace webapp.Data.Repositories;

public class FarewellRepository
(
    DatabaseContext databaseContext
)
{
    private MySqlConnection Connection { get; } = databaseContext.Connection;

    private string _farewell = string.Empty;

    private const string GetFirstFarewellRecord = "SELECT farewell FROM farewells LIMIT 1;";

    public string GetFarewell()
    {
        if (_farewell != string.Empty) return _farewell;

        using var cmd = new MySqlCommand(GetFirstFarewellRecord, Connection);

        using var reader = cmd.ExecuteReader();

        reader.Read();

        _farewell = reader.GetString(0);

        return _farewell;
    }
}